module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Messages exposing (..)
import Model exposing (..)


view : Model -> Html Msg
view model =
    section
        []
        [ headerView
        , bodyView model
        ]


headerView : Html Msg
headerView =
    header
        [ class "main-header" ]
        [ h1
            []
            [ text "Home page" ]
        ]


bodyView : Model -> Html Msg
bodyView model =
    let
        message =
            case model.pongs of
                0 ->
                    ""

                1 ->
                    (toString model.pongs) ++ " pong received!"

                _ ->
                    (toString model.pongs) ++ " pongs received!"
    in
        div []
            [ button
                [ onClick SendPing ]
                [ text "Send ping!" ]
            , text message
            ]
