module SingaporeCPFCalculator
  module Year2014
    module SPR1FG

      # Payment calculator for Singapore's Central Provident Fund for employee's age 50 to 55.
      class Age50To55ContributionCalculator < Age50BelowContributionCalculator

        extend Requirements::GroupAbove50To55Years

        private

        def tc_rate_1
          "0.14"
        end

        def tc_rate_2
          "0.19"
        end

        def adjustment_rate
          "0.15"
        end

        def ec_rate
          "0.05"
        end

      end

    end
  end
end
