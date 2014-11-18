module SingaporeCPFCalculator
  module Year2015
    module SPR1GG

      # Payment calculator for Singapore's Central Provident Fund for employee's age 65 and above.
      class Age65UpContributionCalculator < Age60To65ContributionCalculator

        extend Requirements::GroupAbove65Years

      end

    end
  end
end
