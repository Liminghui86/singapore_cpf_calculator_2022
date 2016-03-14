module SingaporeCPFCalculator
  module Year2015
    module CitizenOrSPR3
      # Base calculator for citizen or spr3 in year 2015
      class CitizenOrSpr3Base < Year2015::Base
        include SingaporeCPFCalculator::Year2012To2015AwCeilingModule
      end
    end
  end
end
