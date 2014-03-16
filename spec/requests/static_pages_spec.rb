require 'spec_helper'

describe "Static pages" do
  let(:base_title) { "Crappy Books | " }
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Crappy-Book-Store.com') }
    it { should have_title("Crappy Books") }
  end

   describe "Help page" do
    before { visit help_path }

    it { should have_content('Need some help?') }
    it { should have_title("#{base_title} Help") }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About Us') }
    it { should have_title("#{base_title} About") }
  end
end
