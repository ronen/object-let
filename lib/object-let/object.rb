module ObjectLet
  module Object
    def let
      yield self
    end
  end
end
