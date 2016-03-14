module SingaporeCPFCalculator
  module Year2016
    module CitizenOrSPR3
      # Base calculator for citizen or spr3 in year 2016
      class CitizenOrSpr3Base < Year2016::Base
        def additional_wage_ceiling
          d('102_000')
        end
      end
    end
  end
end
