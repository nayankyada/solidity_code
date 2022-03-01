// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 < 0.9.0;

contract Struct{
    struct Movie {
        string title;
        string director;
        uint movie_id;
    }
    Movie public movie;

    // set movie id
    function setMoview() public {
       movie =  Movie("First Movie","Nayan Kyada",125);
    }

    // to get movie id
    function getMovieId() public view returns(uint){
        return movie.movie_id;
    }

    // to set single property of movie
    function setMovieId(uint id) public {
        movie.movie_id = id;
    }
}