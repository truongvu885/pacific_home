define("custom:views/CProduct/record/detail", [
  "views/record/detail",
], function (Dep) {
  return Dep.extend({
    template: "custom:CProduct/record/detail",

    gasUrl:
      "https://script.google.com/macros/s/AKfycbxw-e9nZacgUDoK31RoKgqgeBEx97KdnwRPL-GZMoIeB4nGWwzP85GITuVKZ_CrZlM7/exec",

    data: function () {
      return {
        ptgDataIds: this.ptgDataIds || [],
      };
    },
    setup: function () {
      Dep.prototype.setup.call(this);

      // Load custom CSS
      this.loadCProductDetailCSS();
      this.ptgDataIds = [];
      const ptgData = this.model.get("ptgData");
      console.log("test ptgData:");
      
      console.log(ptgData);
      if (ptgData) {
        this.getPtgId(ptgData);
      }
    },

    afterRender: function () {
      Dep.prototype.afterRender.call(this);

      console.log(this.ptgDataIds);

      // Create child views for custom panels
      this.createPanelViews();

      // Setup fullscreen image viewer
      this.setupImageViewer();
    },

    getPtgId: function (ptgData) {
      ptgData.forEach((element) => {
        var ptgId = element.viewUrl.split("=")[1];
        this.ptgDataIds.push(ptgId);
      });
    },

    /**
     * Load custom CSS for CProduct detail view
     */
    loadCProductDetailCSS: function () {
      var cssPath =
        this.getBasePath() +
        "client/custom/modules/CProduct/css/cproduct-detail.css";

      if (!document.querySelector('link[href="' + cssPath + '"]')) {
        var link = document.createElement("link");
        link.rel = "stylesheet";
        link.type = "text/css";
        link.href = cssPath;
        document.head.appendChild(link);
      }
    },

    /**
     * Create child views for all custom panels
     */
    createPanelViews: function () {
      var model = this.model;

      // Panel 2 Left: Specifications
      this.createView(
        "specifications",
        "custom:views/CProduct/record/detail-panel-specifications",
        {
          selector: ".cproduct-specifications-container",
          model: model,
        },
        function (view) {
          view.render();
        }
      );

      // Panel 2 Right: Owner
      this.createView(
        "owner",
        "custom:views/CProduct/record/detail-panel-owner",
        {
          selector: ".cproduct-owner-container",
          model: model,
        },
        function (view) {
          view.render();
        }
      );

      // Panel 3: Related Products
      this.createView(
        "relatedProducts",
        "custom:views/CProduct/record/detail-panel-related",
        {
          selector: ".cproduct-related-container",
          model: model,
        },
        function (view) {
          view.render();
        }
      );

      // Panel 4 Right: History
      this.createView(
        "history",
        "custom:views/CProduct/record/detail-panel-history",
        {
          selector: ".cproduct-history-container",
          model: model,
        },
        function (view) {
          view.render();
        }
      );
    },

    /**
     * Setup fullscreen image viewer with zoom functionality
     */
    setupImageViewer: function () {
      var self = this;
      var viewer = this.$el.find("#cproduct-fullscreen-viewer");
      var viewerImage = this.$el.find("#cproduct-fullscreen-image");
      var overlay = this.$el.find(".cproduct-fullscreen-overlay");
      var closeBtn = this.$el.find(".cproduct-fullscreen-close");
      var zoomInBtn = this.$el.find(".cproduct-zoom-in");
      var zoomOutBtn = this.$el.find(".cproduct-zoom-out");
      var zoomResetBtn = this.$el.find(".cproduct-zoom-reset");

      if (!viewer.length) return;

      var currentZoom = 1;
      var zoomStep = 0.25;
      var minZoom = 0.5;
      var maxZoom = 3;

      // Pan variables
      var isDragging = false;
      var startX = 0;
      var startY = 0;
      var translateX = 0;
      var translateY = 0;

      // Function to show fullscreen viewer
      var showViewer = function (src, alt) {
        if (!src) return;
        viewerImage.attr("src", src);
        viewerImage.attr("alt", alt || "");
        viewer.css("display", "flex");
        currentZoom = 1;
        translateX = 0;
        translateY = 0;
        viewerImage.css("transform", "scale(1) translate(0, 0)");
        $("body").css("overflow", "hidden");
      };

      // Function to hide fullscreen viewer
      var hideViewer = function () {
        viewer.css("display", "none");
        viewerImage.attr("src", "");
        currentZoom = 1;
        translateX = 0;
        translateY = 0;
        isDragging = false;
        $("body").css("overflow", "");
      };

      // Function to update zoom
      var updateZoom = function (newZoom) {
        currentZoom = Math.max(minZoom, Math.min(maxZoom, newZoom));

        // Reset translate when zoom is 1 or less
        if (currentZoom <= 1) {
          translateX = 0;
          translateY = 0;
        }

        viewerImage.css({
          transform:
            "scale(" +
            currentZoom +
            ") translate(" +
            translateX +
            "px, " +
            translateY +
            "px)",
          transition: "transform 0.2s ease",
        });
      };

      // Function to update pan position
      var updatePan = function () {
        viewerImage.css({
          transform:
            "scale(" +
            currentZoom +
            ") translate(" +
            translateX +
            "px, " +
            translateY +
            "px)",
          transition: "none",
        });
      };

      // Zoom in
      zoomInBtn.on("click", function (e) {
        e.stopPropagation();
        updateZoom(currentZoom + zoomStep);
      });

      // Zoom out
      zoomOutBtn.on("click", function (e) {
        e.stopPropagation();
        updateZoom(currentZoom - zoomStep);
      });

      // Reset zoom
      zoomResetBtn.on("click", function (e) {
        e.stopPropagation();
        updateZoom(1);
      });

      // Close viewer
      closeBtn.on("click", function (e) {
        e.stopPropagation();
        hideViewer();
      });

      // Click overlay to close
      overlay.on("click", function () {
        hideViewer();
      });

      // ESC key to close
      $(document).on("keyup.cproductViewer", function (e) {
        if (e.key === "Escape" && viewer.css("display") !== "none") {
          hideViewer();
        }
      });

      // Mouse wheel to zoom
      viewerImage.on("wheel", function (e) {
        e.preventDefault();
        var delta = e.originalEvent.deltaY;
        if (delta < 0) {
          updateZoom(currentZoom + zoomStep / 2);
        } else {
          updateZoom(currentZoom - zoomStep / 2);
        }
      });

      // Mouse drag to pan (when zoomed)
      viewerImage.on("mousedown", function (e) {
        if (currentZoom <= 1) return;
        isDragging = true;
        startX = e.clientX - translateX;
        startY = e.clientY - translateY;
        viewerImage.css("cursor", "grabbing");
        e.preventDefault();
      });

      $(document).on("mousemove.cproductPan", function (e) {
        if (!isDragging || currentZoom <= 1) return;
        translateX = e.clientX - startX;
        translateY = e.clientY - startY;
        updatePan();
      });

      $(document).on("mouseup.cproductPan", function () {
        if (isDragging) {
          isDragging = false;
          if (currentZoom > 1) {
            viewerImage.css("cursor", "grab");
          } else {
            viewerImage.css("cursor", "zoom-in");
          }
        }
      });

      // Touch events for mobile
      var touchStartX = 0;
      var touchStartY = 0;
      var lastTouchX = 0;
      var lastTouchY = 0;

      viewerImage.on("touchstart", function (e) {
        if (currentZoom <= 1) return;
        var touch = e.originalEvent.touches[0];
        touchStartX = touch.clientX - translateX;
        touchStartY = touch.clientY - translateY;
        lastTouchX = touch.clientX;
        lastTouchY = touch.clientY;
        isDragging = true;
        e.preventDefault();
      });

      viewerImage.on("touchmove", function (e) {
        if (!isDragging || currentZoom <= 1) return;
        var touch = e.originalEvent.touches[0];
        translateX = touch.clientX - touchStartX;
        translateY = touch.clientY - touchStartY;
        lastTouchX = touch.clientX;
        lastTouchY = touch.clientY;
        updatePan();
        e.preventDefault();
      });

      viewerImage.on("touchend", function () {
        isDragging = false;
      });

      // Update cursor based on zoom level
      viewerImage.on("load", function () {
        if (currentZoom > 1) {
          viewerImage.css("cursor", "grab");
        } else {
          viewerImage.css("cursor", "default");
        }
      });

      // Click on zoomable images to open viewer
      this.$el.find(".cproduct-zoomable-image").each(function () {
        var $img = $(this);
        $img.css("cursor", "zoom-in");
        $img.on("click", function () {
          showViewer($img.attr("src"), $img.attr("alt"));
        });
      });
    },

    onRemove: function () {
      // Clean up event listeners
      $(document).off("keyup.cproductViewer");
      $(document).off("mousemove.cproductPan");
      $(document).off("mouseup.cproductPan");
      Dep.prototype.onRemove.call(this);
    },
  });
});
