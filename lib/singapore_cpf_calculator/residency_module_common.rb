module SingaporeCPFCalculator
  module ResidencyModuleCommon

    # @param [Date] date current date to which the age is calculated
    # @param [Date] birthdate
    # @return [#calculator] returns the CPF calculator that matches the age.
    def calculator_for(date, birthdate:)
      calculators.find { |calculator| calculator.applies_to? date, birthdate: birthdate }
    end

  end
end
