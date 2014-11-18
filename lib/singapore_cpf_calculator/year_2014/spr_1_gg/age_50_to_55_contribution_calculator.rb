module SingaporeCPFCalculator
  module Year2014
    module SPR1GG

      # Payment calculator for Singapore's Central Provident Fund for employee's age 50 to 55.
      class Age50To55ContributionCalculator < Age50BelowContributionCalculator

        extend Requirements::GroupAbove50To55Years

      end

    end
  end
end
