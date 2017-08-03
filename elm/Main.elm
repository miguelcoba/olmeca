module Main exposing (..)

import Html exposing (Html, text, programWithFlags)
import Model exposing (..)
import Messages exposing (Msg(..))
import Subscriptions exposing (subscriptions)
import View exposing (view)
import Update exposing (update)


init : Flags -> ( Model, Cmd Msg )
init flags =
    let
        model =
            initialModel flags
    in
        ( model, Cmd.none )


main : Program Flags Model Msg
main =
    programWithFlags
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
