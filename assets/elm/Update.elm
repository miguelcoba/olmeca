module Update exposing (..)

import Messages exposing (..)
import Model exposing (..)
import Phoenix
import Phoenix.Push as Push


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SendPing ->
            let
                push =
                    Push.init "authorized" "ping"
                        |> Push.onOk (\_ -> Pong)
            in
                model ! [ Phoenix.push model.flags.socketUrl push ]

        Pong ->
            { model | pongs = model.pongs + 1 } ! []
