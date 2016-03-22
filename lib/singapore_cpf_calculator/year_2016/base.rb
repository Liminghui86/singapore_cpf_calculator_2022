module SingaporeCPFCalculator
  module Year2016

    # Base class for 2014 CPF calculators.
    class Base < BaseCalculator

      private

      def additional_wage_ceiling
        d('102_000')
      end

      def capped_ordinary_wages
        [d("6_000"), ordinary_wages].min
      end

    end

  end

end
