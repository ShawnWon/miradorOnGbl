module Geoblacklight
  class ItemViewer
    def initialize(references)
      @references = references
    end

    def viewer_protocol
      return 'map' if viewer_preference.nil?
      viewer_preference.keys.first.to_s
    end

    def viewer_endpoint
      return '' if viewer_preference.nil?
      viewer_preference.values.first.to_s
    end

    def wms
      @references.wms
    end

    def iiif
      @references.iiif
    end

    # HERE - Added viewer
    def iiif_manifest
      @references.iiif_manifest
    end

    def tiled_map_layer
      @references.tiled_map_layer
    end

    def dynamic_map_layer
      @references.dynamic_map_layer
    end

    def feature_layer
      @references.feature_layer
    end

    def image_map_layer
      @references.image_map_layer
    end

    def index_map
      @references.index_map
    end
    
    # HERE - also need to specify viewer preference
    def viewer_preference
      [index_map, wms, iiif, iiif_manifest, tiled_map_layer, dynamic_map_layer,
       image_map_layer, feature_layer].compact.map(&:to_hash).first
    end
  end
end
