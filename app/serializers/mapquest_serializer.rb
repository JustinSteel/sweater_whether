class MapquestSerializer
  include JSONAPI::Serializer
  attributes :lat, :lng
end
