define("custom:views/CProduct/record/detail", ["views/record/detail"], function (
  Dep
) {
  return Dep.extend({

    template: "custom:CProduct/record/detail",
    
    setup: function () {
      Dep.prototype.setup.call(this);
      
      // Load custom CSS
      this.loadCProductDetailCSS();
    },
    
    afterRender: function () {
      Dep.prototype.afterRender.call(this);
      
      // Create child views for custom panels
      this.createPanelViews();
    },
    
    /**
     * Load custom CSS for CProduct detail view
     */
    loadCProductDetailCSS: function () {
      var cssPath = this.getBasePath() + 'client/custom/modules/CProduct/css/cproduct-detail.css';
      
      if (!document.querySelector('link[href="' + cssPath + '"]')) {
        var link = document.createElement('link');
        link.rel = 'stylesheet';
        link.type = 'text/css';
        link.href = cssPath;
        document.head.appendChild(link);
      }
    },
    
    /**
     * Create child views for all custom panels
     */
    createPanelViews: function () {
      console.log('[CProduct Record Detail] Creating panel views...');
      console.log('[CProduct Record Detail] Looking for containers...');
      console.log('[CProduct Record Detail] .cproduct-specifications-container exists:', this.$el.find('.cproduct-specifications-container').length);
      
      var model = this.model;
      
      // Panel 2 Left: Specifications
      this.createView('specifications', 'custom:views/CProduct/record/detail-panel-specifications', {
        selector: '.cproduct-specifications-container',
        model: model
      }, function (view) {
        console.log('[CProduct Record Detail] Specifications view created, rendering...');
        view.render();
      });
      
      // Panel 2 Right: Owner
      this.createView('owner', 'custom:views/CProduct/record/detail-panel-owner', {
        selector: '.cproduct-owner-container',
        model: model
      }, function (view) {
        view.render();
      });
      
      // Panel 3: Related Products
      this.createView('relatedProducts', 'custom:views/CProduct/record/detail-panel-related', {
        selector: '.cproduct-related-container',
        model: model
      }, function (view) {
        view.render();
      });
      
      // Panel 4 Right: History
      this.createView('history', 'custom:views/CProduct/record/detail-panel-history', {
        selector: '.cproduct-history-container',
        model: model
      }, function (view) {
        view.render();
      });
    }

  });
});
