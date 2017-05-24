class StaticPagesController < ApplicationController
  def home
    render 'home'
  end

  def about
    render 'about'
  end

  def resume
    pdf_filename = File.join(Rails.root, 'lib/assets/pdfs/resume.pdf')
    send_file(pdf_filename, :filename => 'resume.pdf', :disposition => 'inline', :type => 'application/pdf')
  end

  def under_construction
    render 'under_construction'
  end
end
