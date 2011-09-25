// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var Filters = Class.create({
  selected_regions: [],
  
  toggleCategory: function(link) {
    this.toggleFilterLink(link);
  },
  
<<<<<<< HEAD
  toggleRegion: function(name) {
    if (this.selected_regions.include(name)) {
      this.selected_regions = this.selected_regions.without(name);
    } else {
      this.selected_regions.push(name);
    }
    this.updateRegionMap();
    this.loadDataForFilters();
  },
=======
// STEF JONGKIND 16 September 2011

//  toggleRegion: function(name) {
//    if (this.selected_regions.include(name)) {
//      this.selected_regions = this.selected_regions.without(name);
//    } else {
//      this.selected_regions.push(name);
//    }
//    this.updateRegionMap();
//    this.loadDataForFilters();
//  },
  
  toggleRegion: function(name, id) {
    this.selected_regions = [];
    this.selected_region_ids = [];
    this.selected_regions.push(name);
    this.selected_region_ids.push(id);
    this.updateRegionMap();
    this.loadDataForFilters();
  },

//  updateRegionMap: function() {
//    var name = 'none';
//    if (this.selected_regions.length > 0) {
//      name = this.selected_regions.sort().map(function(region_name) {return region_name.gsub(' ', '').underscore();}).join('_');
//    }
//    var full_name = '/images/maps/nz/' + name + '.png';
//    $('region_map_image').src = full_name;
//  },

  updateRegionMap: function() {
    var name = 'region_map';
    if (this.selected_regions.length > 0) {
      name = this.selected_regions.sort().map(function(region_name) {return region_name.gsub(' ', '');});
    }
    var full_name = '/images/maps/nz/' + name + '.png';
    $('region_map_image').src = full_name;
  },
// END 16 September 2011
>>>>>>> d61dc80ac36216a57897abf23172e14d28d0a2f8
  
  toggleTag: function(link) {
    this.toggleFilterLink(link);
  },
  
  toggleFilterLink: function(link) {
    link.blur();
    link.toggleClassName('active');
    this.loadDataForFilters();    
  },
  
<<<<<<< HEAD
  updateRegionMap: function() {
    var name = 'none';
    if (this.selected_regions.length > 0) {
      name = this.selected_regions.sort().map(function(region_name) {return region_name.gsub(' ', '').underscore();}).join('_');
    }
    var full_name = '/images/maps/nz/' + name + '.png';
    $('region_map_image').src = full_name;
  },
  
=======

>>>>>>> d61dc80ac36216a57897abf23172e14d28d0a2f8
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
<<<<<<< HEAD
      'region_names': this.activeRegionNames().join(','),
=======
// STEF JONGKIND 16 September 2011
//	  'region_names': this.activeRegionNames().join(','),
      'region_ids': this.activeRegionIds(),
// END 16 September 2011
>>>>>>> d61dc80ac36216a57897abf23172e14d28d0a2f8
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
  
<<<<<<< HEAD
=======
// STEF JONGKIND 16 September 2011
  activeRegionIds: function() {
    return this.selected_region_ids;
  },
//	activeRegionIds: function() {
//	  return $$('#regions a.active').map(function(element) {
//	    return element.id.split('_').last();
//	  });
//	},
// END 16 September 2011
  
>>>>>>> d61dc80ac36216a57897abf23172e14d28d0a2f8
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
var filters = new Filters();

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

Event.addBehavior({
  'a.toggle_category:click' : function(e) {
    filters.toggleCategory(e.findElement('a'));
  },
  'a.toggle_tag:click' : function(e) {
    filters.toggleTag(e.findElement('a'));
  }
});