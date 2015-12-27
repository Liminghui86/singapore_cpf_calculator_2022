require_relative "spr_1_gg/age_55_below_contribution_calculator"
require_relative "spr_1_gg/age_55_to_60_contribution_calculator"
require_relative "spr_1_gg/age_60_to_65_contribution_calculator"
require_relative "spr_1_gg/age_65_up_contribution_calculator"

module SingaporeCPFCalculator
  module Year2016

    # For Singapore Permanent Resident (SPR) on their first year with graduated (G, partial)
    # employer contribution and graduated (G, partial) employee contribution
    module SPR1GG

      extend ResidencyModuleCommon
      extend SPR1GGCommon

      class << self

        private

        def calculators
          [
            Age55BelowContributionCalculator,
            Age55To60ContributionCalculator,
            Age60To65ContributionCalculator,
            Age65UpContributionCalculator,
          ]
        end

      end

    end

  end
end
