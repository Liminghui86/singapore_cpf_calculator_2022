module SingaporeCPFCalculator
  module Year2014
    module CitizenOrSPR3
      class CitizenOrSpr3Base < Year2014::Base
        include SingaporeCPFCalculator::Year2012To2015AwCeilingModule
      end
    end
  end
end
