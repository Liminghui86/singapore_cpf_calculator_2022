
module SingaporeCPFCalculator
  # Contains the calculators that are used for determining CPF contribution for 2014.
  module SPR1GGCommon

    # @param [String] status: ["citizen", "permanent_resident", "foreigner"]
    # @param [Date] current_date: current date used to determine permanent residency's duration
    # @param [Date] spr_start_date: date when the permanent residency started
    # @param [String] employee_contribution_type: ["full", "graduated"]
    # @param [String] employer_contribution_type: ["full", "graduated"]
    # @return [true, false]
    def applies_to?(
      status:,
      current_date:,
      spr_start_date:,
      employee_contribution_type:,
      employer_contribution_type:
    )
      status == "permanent_resident" &&
        SPRStatus.get(current_date, status_start_date: spr_start_date) == :SPR1 &&
        employee_contribution_type == "graduated" &&
        employer_contribution_type == "graduated"
    end

  end
end
