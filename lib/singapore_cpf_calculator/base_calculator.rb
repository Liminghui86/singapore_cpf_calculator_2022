module SingaporeCPFCalculator
  # Base class for CPF calculators.
  class BaseCalculator

    class << self
      # @param [Fixnum] age
      # @return [true, false] returns true if the calculator applies to the employee's age.
      def applies_to?(date, birthdate:)
        AgeGroup.get(date, birthdate: birthdate) == required_age_group
      end

      # @param [BigDecimal] ordinary_wages:
      #   Ordinary wages are wages due or granted in respect of employment and include allowances (e.g.
      #   food allowance and overtime payments) earned by an employee in the month and payable before
      #   the due date for payment of CPF contributions for that month.
      # @param [BigDecimal] additional_wages:
      #   Additional wages are wage supplements which are not granted wholly and exclusively for the
      #   month, such as annual bonus and leave pay. These and other incentive payments may be made at
      #   intervals of more than a month.
      #
      # @param [BigDecimal] ytd_additional_wages The year to date additional wages
      # @param [BigDecimal] ytd_ow_subject_to_cpf The year to date ordinary wages
      # @return [Hash] returns the total, employee, employer amounts for the CPF contribution
      def calculate(ordinary_wages:, additional_wages:, ytd_additional_wages: 0.0, ytd_ow_subject_to_cpf: 0.0)
        new(ordinary_wages: ordinary_wages, additional_wages: additional_wages,
            ytd_ow_subject_to_cpf: ytd_ow_subject_to_cpf, ytd_additional_wages: ytd_additional_wages).calculate
      end

      private

      def required_age_group
        raise NotImplementedError, "sub classes needs to implement .required_age_group"
      end
    end

    def initialize(ordinary_wages:, additional_wages:, ytd_additional_wages: 0.0, ytd_ow_subject_to_cpf: 0.0)
      @ordinary_wages = ordinary_wages
      @ytd_ow_subject_to_cpf = ytd_ow_subject_to_cpf
      @ytd_additional_wages = ytd_additional_wages
      @additional_wages = clip_additional_wages_based_on_ceiling(additional_wages)
    end

    # @return [Hash] returns the total, employee, employer amounts for the CPF contribution
    def calculate
      CPFContribution.new total: total_contribution,
                          employee: employee_contribution,
                          aw_subject_to_cpf: additional_wages,
                          ow_subject_to_cpf: capped_ordinary_wages
    end

    private

    attr_reader :ordinary_wages, :additional_wages, :ytd_additional_wages, :ytd_ow_subject_to_cpf

    def total_contribution
      @total_contribution ||= calculated_total_contribution.round(0, :half_up)
    end

    def employee_contribution
      @employee_contribution ||= calculated_employee_contribution.round(0, :truncate)
    end

    def employer_contribution
      @employer_contribution ||= total_contribution - employee_contribution
    end

    def total_wages
      ordinary_wages + additional_wages
    end

    def clip_additional_wages_based_on_ceiling(additional_wages)
      if additional_wage_ceiling.blank?
        additional_wages
      else
        [additional_wages, calculated_remaining_wage_ceiling].min
      end
    end

    def calculated_remaining_wage_ceiling
      max_remaining = additional_wage_ceiling - ytd_ow_subject_to_cpf - capped_ordinary_wages - ytd_additional_wages
      [max_remaining, d('0.0')].max
    end

    def calculated_total_contribution
      case
      when total_wages <= d("50.00")
        d("0.0")
      when total_wages <= d("500.00")
        d(tc_rate_1) * total_wages
      when total_wages < d("750.0000")
        (d(tc_rate_1) * total_wages) + (d(adjustment_rate) * (total_wages - d("500.00")))
      else # >= $750
        (d(tc_rate_2) * capped_ordinary_wages) + (d(tc_rate_2) * additional_wages)
      end
    end

    def calculated_employee_contribution
      case
      when total_wages < d("500.0000")
        d("0.0")
      when total_wages < d("750.0000")
        (d(adjustment_rate) * (total_wages - d("500.00")))
      else # >= $750
        (d(ec_rate) * capped_ordinary_wages) + (d(ec_rate) * additional_wages)
      end
    end

    # generally applies only to spr3 and citizens
    def additional_wage_ceiling
      nil
    end

    # TC Rate 1 is
    def tc_rate_1
      raise NotImplementedError, "sub classes needs to implement #tc_rate_1"
    end

    def tc_rate_2
      raise NotImplementedError, "sub classes needs to implement #tc_rate_2"
    end

    def ec_rate
      raise NotImplementedError, "sub classes needs to implement #ec_rate"
    end

    def adjustment_rate
      raise NotImplementedError, "sub classes needs to implement #adjustment_rate"
    end

    def capped_ordinary_wages
      raise NotImplementedError, "sub classes needs to implement #capped_ordinary_wages"
    end

    # precision helper
    def d(val)
      BigDecimal.new val
    end

  end
end
