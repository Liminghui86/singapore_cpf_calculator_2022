require 'spec_helper'

describe SingaporeCPFCalculator::AgeGroup do

  describe "#get" do
    let(:age_group) { described_class.get current_date, birthdate: birthdate }

    context "born 1950-06-15" do
      let(:birthdate) { Date.new(1950, 6, 15) }

      context "when age 49, on the birth month before the birth date" do
        let(:current_date) { Date.new(2000, 6, 1) }
        it { expect(age_group).to eq :group_50_years_and_below }
      end

      context "when age 50, on the birth month after the birth date" do
        let(:current_date) { Date.new(2000, 6, 30) }
        it { expect(age_group).to eq :group_50_years_and_below }
      end

      context "when age 50, on the month after the birth month" do
        let(:current_date) { Date.new(2000, 7, 1) }
        it { expect(age_group).to eq :group_above_50_to_55_years }
      end

      context "when age 55, on the same month as the birth month" do
        let(:current_date) { Date.new(2005, 6, 30) }
        it { expect(age_group).to eq :group_above_50_to_55_years }
      end

      context "when age 55, on the birth month after the birth date" do
        let(:current_date) { Date.new(2005, 7, 1) }
        it { expect(age_group).to eq :group_above_55_to_60_years }
      end

      context "when age 60, on the same month of the birth month" do
        let(:current_date) { Date.new(2010, 6, 30) }
        it { expect(age_group).to eq :group_above_55_to_60_years }
      end

      context "when age 60, on the birth month after the birth date" do
        let(:current_date) { Date.new(2010, 7, 1) }
        it { expect(age_group).to eq :group_above_60_to_65_years }
      end

      context "when age 65, on the same month of the birth month" do
        let(:current_date) { Date.new(2015, 6, 30) }
        it { expect(age_group).to eq :group_above_60_to_65_years }
      end

      context "when age 65, on the month after the birth month" do
        let(:current_date) { Date.new(2015, 7, 1) }
        it { expect(age_group).to eq :group_above_65_years }
      end

      context "when age 100, on the same month of the birth date" do
        let(:current_date) { Date.new(2050, 6, 30) }
        it { expect(age_group).to eq :group_above_65_years }
      end

    end

  end
  
end
