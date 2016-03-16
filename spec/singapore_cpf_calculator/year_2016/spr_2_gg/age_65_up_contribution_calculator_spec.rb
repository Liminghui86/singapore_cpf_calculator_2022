require 'spec_helper'

describe SingaporeCPFCalculator::Year2016::SPR2GG::Age65UpContributionCalculator do

  subject(:calculator) {
    described_class.new ordinary_wages: ordinary_wages,
                        additional_wages: additional_wages
  }

  let(:result) { calculator.calculate }

  let(:additional_wages) { 0.0 }

  describe "#calculate" do

    context "when the total wages amounts to 0.00" do
      let(:ordinary_wages) { 0.00 }
      it { expect(result).to equal_cpf total: 0.00, employee: 0.00, employer: 0.00 }
    end

    context "when the total wages amounts to 50.00" do
      let(:ordinary_wages) { 50.00 }
      it { expect(result).to equal_cpf total: 0.00, employee: 0.00, employer: 0.00, ow: 50 }
    end

    context "when the total wages amounts to 50.01" do
      let(:ordinary_wages) { 50.01 }
      it { expect(result).to equal_cpf total: 2.00, employee: 0.00, employer: 2.00, ow: 50.01 }
    end

    context "when the total wages amounts to 500.00" do
      let(:ordinary_wages) { 500.00 }
      it { expect(result).to equal_cpf total: 18.00, employee: 0.00, employer: 18.00, ow: 500 }
    end

    context "when the total wages amounts to 500.01" do
      let(:ordinary_wages) { 500.01 }
      it { expect(result).to equal_cpf total: 18.00, employee: 0.00, employer: 18.00, ow: 500.01 }
    end

    context "when the total wages amounts to 749.99" do
      let(:ordinary_wages) { 749.99 }
      it { expect(result).to equal_cpf total: 64.00, employee: 37.00, employer: 27.00, ow: 749.99 }
    end

    context "when the total wages amounts to 750.00" do
      let(:ordinary_wages) { 750.00 }
      it { expect(result).to equal_cpf total: 64.00, employee: 37.00, employer: 27.00, ow: 750 }
    end

    context "when the total wages amounts to 5,000.00" do
      let(:ordinary_wages) { 5_000.00 }
      it { expect(result).to equal_cpf total: 425.00, employee: 250.00, employer: 175.00, ow: 5_000 }
    end

    context "when the total wages amounts to 10,000.00" do
      let(:ordinary_wages) { 10_000.00 }
      it { expect(result).to equal_cpf total: 510.00, employee: 300.00, employer: 210.00, ow: 6_000 }
    end

  end

end
