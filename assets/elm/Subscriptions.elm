module Subscriptions exposing (..)

import Messages exposing (Msg(..))
import Model exposing (Model)
import Phoenix
import Phoenix.Channel as Channel exposing (Channel)
import Phoenix.Socket as Socket exposing (Socket)
import Json.Encode exposing (..)


subscriptions : Model -> Sub Msg
subscriptions model =
    Phoenix.connect (socket model.flags.socketUrl) [ channel model ]


socket : String -> Socket Msg
socket socketUrl =
    Socket.init socketUrl


channel : Model -> Channel Msg
channel model =
    Channel.init "authorized"
        |> Channel.withPayload (credentials model)
        |> Channel.withDebug


credentials : Model -> Json.Encode.Value
credentials model =
    Json.Encode.object [ ( "guardian_token", string model.flags.guardianToken ) ]
