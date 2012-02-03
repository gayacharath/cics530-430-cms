require 'spec_helper'

describe "contributor use cases" do

  context "viewing projects" do
  
    it "should list all the projects are thiers"
    
    it "should list the project names"
    
    it "should have links to the projects"
  
  end
  
  context "searching projects" do
  
    it "should let them search by project name"
    
    it "should notify them when there are no search results"
    
    it "should have links to projects in results"
  
  end
  
  context "downloading resource" do
  
    it "should have alink to download from the project page"
    
    it "should display an error message if file not found"
    
  end
  
  
  context "adding a resource" do
  
    it "there should be a link to download the resource after upload"
  
    it "should belong the the user that uploaded the resource"
    
    it "should be possible to upload from a project page"
  
  end
  
  
  context "removing a resource" do
  
    it "should be able remove owned resource"
    
    it "should not be able to remove resources that aren't own"
  
    
  
  end
  
  context "replacing a resource" do
    it "should be able replace owned resource"
    
    it "should not be able to replace resources that aren't own"
  
  end
  
  
  context "creating a project" do
  
    it "should make then manager for the project"
    
    it "there is a link from thier dashboard"
    
    it "should create a page for the project"
    
    it "should allow them to invite contributors"
  
  end
end