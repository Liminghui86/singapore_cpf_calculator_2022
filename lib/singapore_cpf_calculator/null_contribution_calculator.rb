module SingaporeCPFCalculator

  # Null CPF calculators.
  module NullContributionCalculator

    class << self

      # returns zero value
      def calculate(*)
        CPFContribution.new total: BigDecimal.new("0.0"),
                            employee: BigDecimal.new("0.0"),
                            ow_subject_to_cpf: BigDecimal('0.0'),
                            aw_subject_to_cpf: BigDecimal('0.0')
      end

    end

  end
end
