require "rails_helper"

RSpec.describe Buck, type: :model do
  describe "#fit_text" do
    context "with no spaces" do
      let(:text) do
        "https://bill-buck-generator.herokuapp.com/?to=Shelby+Benton&for_message=Your+hard+work&buck_type=vonette"
      end
      it "returns original text" do
        expect(Buck.new.fit_text(text, 510)).to eq text
      end
    end

    context "with non-wrapping text" do
      let(:text) { "hello\r\nmy\r\nname \r\nis\r\n\r\nshelby" }
      it "returns original text" do
        expect(Buck.new.fit_text(text, 510)).to eq text
      end
    end

    context "with wrapping text" do
      let(:text) { "this is a really long line of text that should wrap." }
      let(:wrapped_text) do
        "this is a really long line of text that should\nwrap."
      end
      it "returns wrapped text" do
        expect(Buck.new.fit_text(text, 510)).to eq wrapped_text
      end
    end

    context "with wrapping and new lines" do
      let(:text) do
        "this is a really long line of text that should wrap.\r\n\r\n- Bill"
      end
      let(:wrapped_text) do
        "this is a really long line of text that should\nwrap.\r\n\r\n- Bill"
      end
      it "returns wrapped text" do
        expect(Buck.new.fit_text(text, 510)).to eq wrapped_text
      end
    end

    context "with one really long word" do
      let(:text) do
        "check this out: https://bill-buck-generator.herokuapp.com/?to=Shelby+Benton&for_message=Your+hard+work&buck_type=vonette\r\n You won't believe what happens next"
      end
      let(:wrapped_text) do
        "check this out:\nhttps://bill-buck-generator.herokuapp.com/?to=Shelby+Benton&for_message=Your+hard+work&buck_type=vonette\r\n\nYou won't believe what happens next"
      end
      it "returns original text" do
        expect(Buck.new.fit_text(text, 510)).to eq wrapped_text
      end
    end
  end

  describe ".balances_by_recipient" do
    it "counts vonette as 5 and bill as 1" do
      Buck.create!(to: "Alice", from: "Bob", buck_type: "vonette")
      Buck.create!(to: "Alice", from: "Bob", buck_type: "bill")

      result = Buck.balances_by_recipient.first
      expect(result.balance).to eq(6)
    end

    it "excludes bucks with nil or empty to" do
      Buck.new(to: "", from: "Bob", buck_type: "bill").save(validate: false)
      Buck.create!(to: "Alice", from: "Bob", buck_type: "bill")

      results = Buck.balances_by_recipient
      expect(results.length).to eq(1)
      expect(results.first.name).to eq("alice")
    end

    it "groups case-insensitively" do
      Buck.create!(to: "Alice", from: "Bob", buck_type: "bill")
      Buck.create!(to: "alice", from: "Carol", buck_type: "bill")

      results = Buck.balances_by_recipient
      expect(results.length).to eq(1)
      expect(results.first.balance).to eq(2)
    end

    it "orders by balance descending" do
      Buck.create!(to: "Alice", from: "Bob", buck_type: "bill")
      Buck.create!(to: "Zara", from: "Bob", buck_type: "vonette")

      results = Buck.balances_by_recipient
      expect(results.first.name).to eq("zara")
    end
  end
end
