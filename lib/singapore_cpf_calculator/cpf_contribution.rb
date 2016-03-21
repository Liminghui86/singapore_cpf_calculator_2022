module SingaporeCPFCalculator

  # Result object that describes the total, employee, and employer contribution.
  class CPFContribution

    # @return [BigDecimal]
    attr_reader :total, :employee, :ow_subject_to_cpf, :aw_subject_to_cpf

    # @param [BigDecimal] total the total contribution amount
    # @param [BigDecimal] employee the employee contribution amount
    # @param [BigDecimal] ow_subject_to_cpf Ordinary Wages which were subject to CPF
    # @param [BigDecimal] aw_subject_to_cpf Additional Wages which were subject to CPF
    def initialize(total:, employee:, ow_subject_to_cpf:, aw_subject_to_cpf:)
      @total = total
      @employee = employee
      @ow_subject_to_cpf = ow_subject_to_cpf
      @aw_subject_to_cpf = aw_subject_to_cpf
    end

    # @return [BigDecimal] difference between the total and employee contributions
    def employer
      @employer ||= total - employee
    end

    # @param [CPFContribution] other
    # @return [TrueClass, FalseClass]
    def ==(other)
      other.kind_of?(CPFContribution) && total == other.total && employee == other.employee &&
        (ow_subject_to_cpf == other.ow_subject_to_cpf) &&
        (aw_subject_to_cpf == other.aw_subject_to_cpf)
    end

    def inspect
      {total: total.to_s, employee: employee.to_s,
       ow_subject_to_cpf: ow_subject_to_cpf.to_s, aw_subject_to_cpf: aw_subject_to_cpf.to_s}.to_json
    end

  end
end
