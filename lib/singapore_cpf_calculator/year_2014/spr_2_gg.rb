require_relative "spr_2_gg/age_50_below_contribution_calculator"
require_relative "spr_2_gg/age_50_to_55_contribution_calculator"
require_relative "spr_2_gg/age_55_to_60_contribution_calculator"
require_relative "spr_2_gg/age_60_to_65_contribution_calculator"
require_relative "spr_2_gg/age_65_up_contribution_calculator"

module SingaporeCPFCalculator
  module Year2014

    # For Singapore Permanent Resident (SPR) on their first year with graduated (G, partial)
    # employer contribution and graduated (G, partial) employee contribution
    module SPR2GG

      extend ResidencyModuleCommon
      extend SPR2GGCommon

      class << self

        private

        def calculators
          [
            Age50BelowContributionCalculator,
            Age50To55ContributionCalculator,
            Age55To60ContributionCalculator,
            Age60To65ContributionCalculator,
            Age65UpContributionCalculator,
          ]
        end

      end

    end

  end
end
