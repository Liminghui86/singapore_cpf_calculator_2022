require_relative "citizen_or_spr_3/age_55_below_contribution_calculator"
require_relative "citizen_or_spr_3/age_55_to_60_contribution_calculator"
require_relative "citizen_or_spr_3/age_60_to_65_contribution_calculator"
require_relative "citizen_or_spr_3/age_65_up_contribution_calculator"

module SingaporeCPFCalculator
  module Year2016

    # Residency module for Singaporean Citizen and Permanent Residents on their 3rd year.
    module CitizenOrSPR3

      extend ResidencyModuleCommon
      extend CitizenOrSPR3Common

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
