class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def resume
    pdf_filename = File.join(Rails.root, 'lib/assets/pdfs/resume.pdf')
    send_file(pdf_filename, :filename => 'resume.pdf', :disposition => 'inline', :type => 'application/pdf')
  end

  def under_construction
  end

  def scattergories_die
  end
end
