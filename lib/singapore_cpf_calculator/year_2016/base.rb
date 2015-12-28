module SingaporeCPFCalculator
  module Year2016

    # Base class for 2014 CPF calculators.
    class Base < BaseCalculator

      private

      def capped_ordinary_wages
        [d("6_000"), ordinary_wages].min
      end

    end

  end

end
