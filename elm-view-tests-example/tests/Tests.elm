module Tests exposing (..)

import Expect
import Fuzz exposing (string)
import Test exposing (..)


all : Test
all =
    describe "A Test Suite"
        [ test "Addition" <|
            \_ ->
                Expect.equal 10 (3 + 7)
        , test "String.reverse 'git'" <|
            \_ ->
                Expect.equal "tig" (String.reverse "git")
        , fuzz string "String.reverse (String.reverse x) should return x" <|
            \x ->
                Expect.equal x (String.reverse (String.reverse x))
        ]
