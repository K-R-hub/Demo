abstract class NewsState{}

class NewsInistialState extends NewsState{}


class NewsBottomNavState extends NewsState{}

class NewslodingState extends NewsState{}

class NewsGetBusinessSucssessState extends NewsState{}

class NewsGetBusinessErorrState extends NewsState{
   final String erorr;
   NewsGetBusinessErorrState(this.erorr);

}

class NewsGetSportsSucssessState extends NewsState{}

class NewsGetSportsErorrState extends NewsState{
   final String erorr;
   NewsGetSportsErorrState(this.erorr);

}

class NewsGetScienceSucssessState extends NewsState{}

class NewsGetScienceErorrState extends NewsState{
   final String erorr;
   NewsGetScienceErorrState(this.erorr);

}
class NewsGetSearchSucssessState extends NewsState{}

class NewsGetSearchErorrState extends NewsState{
   final String erorr;
   NewsGetSearchErorrState(this.erorr);

}