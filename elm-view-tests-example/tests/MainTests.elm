module MainTests exposing (..)

import Expect
import Fuzz exposing (string)
import Html.Attributes as Attributes
import Main exposing (LinkItem, Msg(..))
import Test exposing (..)
import Test.Html.Event as Event
import Test.Html.Query as Query
import Test.Html.Selector exposing (attribute, class, disabled, tag, text)


all : Test
all =
    describe "Main"
        [ describe "link view"
            [ test "sets title" <|
                \_ ->
                    let
                        someTitle =
                            "The Title"
                    in
                    Main.link someTitle ""
                        |> Query.fromHtml
                        |> Query.has [ text someTitle ]
            , test "sets url" <|
                \_ ->
                    let
                        someUrl =
                            "http://example.com"
                    in
                    Main.link "" someUrl
                        |> Query.fromHtml
                        |> Query.has [ attribute (Attributes.href someUrl) ]
            , fuzz2 string string "sets title and url" <|
                \title url ->
                    Main.link title url
                        |> Query.fromHtml
                        |> Query.has
                            [ text title
                            , attribute (Attributes.href url)
                            ]
            ]
        , describe "linkItem view"
            [ test "sends DeleteListItem" <|
                \_ ->
                    let
                        someId =
                            "123"

                        someItem : LinkItem
                        someItem =
                            { id = someId, title = "", url = "" }
                    in
                    Main.linkItem someItem
                        |> Query.fromHtml
                        |> Query.find [ tag "button" ]
                        |> Event.simulate Event.click
                        |> Event.expect (DeleteListItem someId)
            ]
        , describe "links view"
            [ test "shows 2 links" <|
                \_ ->
                    let
                        links : List LinkItem
                        links =
                            [ { id = "1", title = "", url = "" }
                            , { id = "2", title = "", url = "" }
                            ]
                    in
                    Main.links links
                        |> Query.fromHtml
                        |> Query.findAll [ tag "li" ]
                        |> Query.count (Expect.equal 2)
            ]
        ]
