// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var Filters = Class.create({
  selected_regions: [],
  
  initialize: function(container_id) {
    this.container_id = container_id;
  },
  
  toggleCategory: function(link) {
    link.blur();
    link.toggleClassName('active');
    this.loadDataForFilters();
  },
  
  
  toggleRegion: function(name) {
    if (this.selected_regions.include(name)) {
      this.selected_regions = this.selected_regions.without(name)
    } else {
      this.selected_regions.push(name);
    }
    this.loadDataForFilters();
  },
  
  loadDataForFilters: function() {
    this.displayLoadingData();
    new Ajax.Request("/projects.js", {
      method: 'get',
      parameters: this.currentFilterParameters(),
      onSuccess: function(transport) {
        this.clearNotice();
      }.bind(this),
      onFailure: function(transport) {
        this.setNotice('error', "Failure")
      }.bind(this)
    }
    );
  },
  
  currentFilterParameters: function() {
    return {
      'category_ids': this.activeCategoryIds().join(','),
      'region_names': this.activeRegionNames().join(',')
    };
  },
  
  activeCategoryIds: function() {
    return $$('#categories a.active').map(function(element) {
      return element.id.split('_').last();
    });
  },
  
  activeRegionNames: function() {
    return this.selected_regions;
  },
  
  displayLoadingData: function() {
    this.setNotice('notice', 'Loading')
  },
  
  setNotice: function(type, message) {
    $('project_notices').update("<div class=\"message " + type + "\">" + message + "</div>")
  },
  
  clearNotice: function() {
    $('project_notices').update('');
  }
  
  
});