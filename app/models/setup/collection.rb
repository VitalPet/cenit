module Setup
  class Collection
    include CenitScoped
    include CollectionBehavior
    include Taggable
    include RailsAdmin::Models::Setup::CollectionAdmin

    image_with AccountImageUploader

    unique_name
    # TODO: Include Data data types on dependencies
    embeds_many :data, class_name: Setup::CollectionData.to_s, inverse_of: :setup_collection

    accepts_nested_attributes_for :data, allow_destroy: true
  end
end
