module Model exposing (..)


type alias Flags =
    { socketUrl : String
    , guardianToken : String
    }


type alias Model =
    { flags : Flags
    , pongs : Int
    }


initialModel : Flags -> Model
initialModel flags =
    { flags = flags
    , pongs = 0
    }
