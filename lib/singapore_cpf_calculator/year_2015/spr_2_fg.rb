require_relative "spr_2_fg/age_50_below_contribution_calculator"
require_relative "spr_2_fg/age_50_to_55_contribution_calculator"
require_relative "spr_2_fg/age_55_to_60_contribution_calculator"
require_relative "spr_2_fg/age_60_to_65_contribution_calculator"
require_relative "spr_2_fg/age_65_up_contribution_calculator"

module SingaporeCPFCalculator
  module Year2015

    # For Singapore Permanent Resident (SPR) on their second year with graduated (G, partial)
    # employee contribution and full (F) employer contribution
    module SPR2FG

      extend ResidencyModuleCommon
      extend SPR2FGCommon

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
