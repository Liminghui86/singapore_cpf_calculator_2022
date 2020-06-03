require 'spec_helper'

describe SingaporeCPFCalculator do

  subject(:calculator) { described_class }

  describe "#calculate" do

    let(:ytd_ow_subject_to_cpf) { 0.0 }
    let(:ytd_additional_wages) { 0.0 }
    let(:estimated_yearly_ow) { 0.0 }

    let(:result) {
      calculator.calculate date: date,
                           birthdate: birthdate,
                           residency_status: residency_status,
                           spr_start_date: spr_start_date,
                           ordinary_wages: ordinary_wages,
                           additional_wages: additional_wages,
                           employee_contribution_type: employee_contribution_type,
                           employer_contribution_type: employer_contribution_type,
      ytd_ow_subject_to_cpf: ytd_ow_subject_to_cpf, # year_total_for("ow_subject_to_cpf"),
      ytd_additional_wages: ytd_additional_wages,   # year_total_for("aw_subject_to_cpf"),
      estimated_yearly_ow: estimated_yearly_ow      # estimated_yearly_ordinary_wages
    }

    describe "27 years old permanent resident from 2nd day of payroll" do
      let(:birthdate) { Date.new(1992, 5, 27) }
      let(:date) { Date.new(2019, 5, 31) }
      let(:residency_status) { "permanent_resident" }
      let(:spr_start_date) { Date.new(2019, 5, 2) }
      let(:ordinary_wages) { 1652.17 }
      let(:additional_wages) { 87.69 }
      let(:employee_contribution_type) { "graduated" }
      let(:employer_contribution_type) { "graduated" }

      it { expect(result).to equal_cpf total: 157.00, employee: 86.00, employer: 71.00, ow: 1652.17, aw: 87.69 }

      context "ordinary_wages is somehow higher" do
        let(:ordinary_wages) { 1734.78 }
        it { expect(result).to equal_cpf total: 164.00, employee: 91.00, employer: 71.00, ow: 1734.78, aw: 87.69 }

        context "may first is not taken into account" do
          let(:effective_portion) { 0.9565217391304348 }
          let(:ordinary_wages) { 1734.78 * effective_portion }
          it { expect(result).to equal_cpf total: 157.00, employee: 87.00, employer: 70.00, ow: 1659.3547826086956, aw: 87.69 }
        end
      end

      describe "with year to date data" do
        let(:ytd_ow_subject_to_cpf) { BigDecimal("1659.3548") }
        let(:ytd_additional_wages) { BigDecimal("83.8774") }
        let(:estimated_yearly_ow) { BigDecimal("22800.0") }
        it { expect(result).to equal_cpf total: 157.00, employee: 86.00, employer: 71.00, ow: 1652.17, aw: 87.69 }

        context "if it had received his PR few days before" do
          let(:spr_start_date) { Date.new(2019, 4, 25) }
          it { expect(result).to equal_cpf total: 157.00, employee: 86.00, employer: 71.00, ow: 1652.17, aw: 87.69 }
        end

        context "if it had received his PR few days after" do
          let(:spr_start_date) { Date.new(2019, 5, 9) }
          it { expect(result).to equal_cpf total: 157.00, employee: 86.00, employer: 71.00, ow: 1652.17, aw: 87.69 }
        end
      end
    end

    describe "30 years old permanent resident earning $952.00 a month" do
      let(:birthdate) { Date.new(1982, 2, 19) }
      let(:date) { Date.new(2014, 11, 15) }
      let(:residency_status) { "permanent_resident" }
      let(:spr_start_date) { Date.new(2011, 11, 14) }
      let(:ordinary_wages) { 700.00 }
      let(:additional_wages) { 252.00 }
      let(:employee_contribution_type) { nil }
      let(:employer_contribution_type) { nil }

      it { expect(result).to equal_cpf total: 343.00, employee: 190.00, employer: 153.00, ow: 700.0, aw: 252.00 }
    end

    describe "30 years old earning $952.00 a month before permanent residency" do
      let(:birthdate) { Date.new(1982, 2, 19) }
      let(:date) { Date.new(2014, 11, 15) }
      let(:residency_status) { "permanent_resident" }
      let(:spr_start_date) { Date.new(2015, 11, 14) }
      let(:ordinary_wages) { 700.00 }
      let(:additional_wages) { 252.00 }
      let(:employee_contribution_type) { "graduated" }
      let(:employer_contribution_type) { "graduated" }

      it { expect(result).to equal_cpf total: 0.00, employee: 0.00, employer: 0.00 }
    end

  end

end
