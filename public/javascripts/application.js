// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var Filters = Class.create({
  selected_regions: [],
  selected_old_tags: [],
  selected_old_category_id: [],
  selected_tags: [],
  selected_region_ids: [],
  selected_category_ids: [],
  
//  Stef Jongkind 24 Oct 2011 please, leave comment for future revert
//  toggleCategory: function(link) {
//    this.toggleFilterLink(link);
//  },

  toggleCategory: function(link, id) {
	this.resetSelections();
    this.selected_old_category_id.push(id);
    this.selected_category_ids.push(link);
    this.loadDataForFilters();
	$(id).addClassName('active');
},


 resetSelections: function() {
	this.selected_tags = [];
	this.selected_regions = [];
	this.selected_region_ids = [];
	this.selected_category_ids = [];
	if (this.selected_old_category_id.length > 0) {
		$(this.selected_old_category_id[0]).removeClassName('active');
	}	
	if (this.selected_old_tags.length > 0) {
		$(this.selected_old_tags[0]).removeClassName('active');
	}	
    this.selected_old_category_id = [];
    this.selected_old_tags = [];
	this.updateRegionMap();
 },


  toggleRegion: function(name, id) {
	this.resetSelections();
    this.selected_regions.push(name);
    this.selected_region_ids.push(id);
    this.updateRegionMap();
    this.loadDataForFilters();
  },


  updateRegionMap: function() {
    var name = 'region_map';
    if (this.selected_regions.length > 0) {
      name = this.selected_regions.sort().map(function(region_name) {return region_name.gsub(' ', '').toLowerCase();});
    }
    var full_name = '/images/maps/nz/' + name + '.png';
    $('region_map_image').src = full_name;
  },
  
//  toggleTag: function(link) {
//    //this.toggleFilterLink(link);
//	this.resetSelections();
//    this.selected_tags.push(link);
//    this.loadDataForFilters();    
//    link.addClassName('active');
//    this.selected_old_tags.push(link);
//  },
  
  toggleTag: function(link, id) {
    //this.toggleFilterLink(link);
	this.resetSelections();
    this.selected_old_tags.push(id);
    this.selected_tags.push(link);
    this.loadDataForFilters();    
	$(id).addClassName('active');
  },
  
  toggleFilterLink: function(link) {
    link.blur();
    link.toggleClassName('active');
    this.loadDataForFilters();    
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

//  Stef Jongkind 24 Oct 2011 please, leave comment for future revert
  currentFilterParameters: function() {
    return {
//	  'category_ids': this.activeCategoryIds().join(','),
  	  'category_ids': this.activeCategoryIds(),
      'region_ids': this.activeRegionIds(),
//      'tags': this.activeTags().join(',')
      'tags': this.activeTags()
    };
  },
  
//  activeCategoryIds: function() {
//    return $$('#categories a.active').map(function(element) {
//      return element.id.split('_').last();
//    });
//  },
  
  activeCategoryIds: function() {
    return this.selected_category_ids;
  },
  
  activeRegionNames: function() {
    return this.selected_regions;
  },
  
  activeRegionIds: function() {
    return this.selected_region_ids;
  },

//  activeTags: function() {
//    return $$('#tags a.active').map(function(element) {
//      return element.innerHTML;
//    });
//  },
  
  activeTags: function() {
    return this.selected_tags;
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

