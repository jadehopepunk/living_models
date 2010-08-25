// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var Filters = Class.create({
  selected_regions: [],
  
  initialize: function(container_id) {
    this.container_id = container_id;
  },
  
  toggleCategory: function(link) {
    this.toggleFilterLink(link);
  },
  
  toggleRegion: function(name) {
    if (this.selected_regions.include(name)) {
      this.selected_regions = this.selected_regions.without(name);
    } else {
      this.selected_regions.push(name);
    }
    this.updateRegionMap();
    this.loadDataForFilters();
  },
  
  toggleTag: function(link) {
    this.toggleFilterLink(link);
  },
  
  toggleFilterLink: function(link) {
    link.blur();
    link.toggleClassName('active');
    this.loadDataForFilters();    
  },
  
  updateRegionMap: function() {
    var name = 'none';
    if (this.selected_regions.length > 0) {
      name = this.selected_regions.sort().map(function(region_name) {return region_name.gsub(' ', '').underscore();}).join('_');
    }
    var full_name = '/images/maps/nz/' + name + '.png';
    $('region_map_image').src = full_name;
  },
  
  loadDataForFilters: function() {
    this.displayLoadingData();
    var request = new Ajax.Request("/projects.js", {
      method: 'get',
      parameters: this.currentFilterParameters(),
      onSuccess: function(transport) {
        this.clearNotice();
      }.bind(this),
      onFailure: function(transport) {
        this.setNotice('error', "Failure");
      }.bind(this)
    }
    );
  },
  
  currentFilterParameters: function() {
    return {
      'category_ids': this.activeCategoryIds().join(','),
      'region_names': this.activeRegionNames().join(','),
      'tags': this.activeTags().join(',')
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
  
  activeTags: function() {
    return $$('#tags a.active').map(function(element) {
      return element.innerHTML;
    });
  },
  
  displayLoadingData: function() {
    this.setNotice('notice', 'Loading')
  },
  
  setNotice: function(type, message) {
    $('project_notices').update("<div class=\"message " + type + "\">" + message + "</div>");
  },
  
  clearNotice: function() {
    $('project_notices').update('');
  }
});

var ImageBrowser = Class.create({
  initialize: function(container_id) {
    this.container = $(container_id);
    this.container.select(".thumbnail img").each(function(thumb) {
      thumb.observe('click', this.onThumbClicked.curry(thumb).bind(this));
    }.bind(this));
  },
  
  onThumbClicked: function(thumb, event) {
    var src = this.mainUrl(thumb.src);
    this.setMainUrl(src);
    this.container.select(".thumbnail img.selected").each(function(t) {
      t.removeClassName('selected');
    });
    thumb.addClassName('selected');
  },
  
  mainUrl: function(thumb_url) {
    return thumb_url.sub('/thumb/', '/main/').sub(/\?[0-9]*$/, '');
  },
  
  setMainUrl: function(url) {
    this.container.select(".main_photo img")[0].src = url;
  }
});

