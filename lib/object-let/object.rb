module ObjectLet
  module Object
    def let
      yield self
    end
    def let_if
      yield self if self
    end
  end
end
