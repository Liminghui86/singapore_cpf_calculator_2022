require_relative "spr_1_fg/age_50_below_contribution_calculator"
require_relative "spr_1_fg/age_50_to_55_contribution_calculator"
require_relative "spr_1_fg/age_55_to_60_contribution_calculator"
require_relative "spr_1_fg/age_60_to_65_contribution_calculator"
require_relative "spr_1_fg/age_65_up_contribution_calculator"

module SingaporeCPFCalculator
  module Year2014

    # For Singapore Permanent Resident (SPR) on their first year with graduated (G, partial)
    # employee contribution and full (F) employer contribution
    module SPR1FG

      extend ResidencyModuleCommon
      extend SPR1FGCommon

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
