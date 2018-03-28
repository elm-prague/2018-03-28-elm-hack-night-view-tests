module Main exposing (..)

import Html exposing (Html)
import Html.Attributes as Attributes
import Html.Events as Events
import Html.Keyed


---- MODEL ----


type alias LinkItem =
    { id : String
    , url : String
    , title : String
    }


type alias Model =
    { links : List LinkItem
    }


init : ( Model, Cmd Msg )
init =
    ( { links =
            [ { id = "1", title = "Elm Homepage", url = "http://elm-lang.org/" }
            , { id = "2", title = "Elm Documentation", url = "http://elm-lang.org/docs" }
            , { id = "3", title = "Elm Getting Started", url = "https://guide.elm-lang.org/install.html" }
            ]
      }
    , Cmd.none
    )



---- UPDATE ----


type Msg
    = NoOp
    | DeleteListItem String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        DeleteListItem id ->
            let
                links =
                    List.filter (\link -> link.id /= id) model.links
            in
            ( { model | links = links }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )



---- VIEW ----


link : String -> String -> Html msg
link text url =
    Html.a
        [ Attributes.href url
        , Attributes.target "_blank"
        ]
        [ Html.text text ]


linkItem : LinkItem -> Html Msg
linkItem { id, title, url } =
    Html.li [ Attributes.class "linkItem" ]
        [ link title url
        , Html.div []
            [ Html.button
                [ Events.onClick (DeleteListItem id) ]
                [ Html.text "Delete" ]
            ]
        ]


links : List LinkItem -> Html Msg
links items =
    Html.Keyed.ul [] <|
        List.map (\item -> ( item.id, linkItem item )) items


view : Model -> Html Msg
view model =
    let
        numberOfLinks =
            List.length model.links
    in
    Html.div []
        [ Html.h1 [] [ Html.text ("Links (" ++ toString numberOfLinks ++ ")") ]
        , links model.links
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
