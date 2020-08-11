import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_retrofit_api/cubit/movie_cubit.dart';
import 'package:movie_retrofit_api/util/constant.dart';
import 'package:movie_retrofit_api/util/response.dart';
import 'package:movie_retrofit_api/model/popular.dart';
import 'package:movie_retrofit_api/util/size_config.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Popular Movies'),
      ),
      body: BlocBuilder<MovieCubit,MovieState>
        (builder: (context,state){
          if(state is LoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is ErrorState){
            return Center(
              child: Icon(Icons.close),
            );
          }else if (state is LoadedState){
            final movies = state.movies;
            return _buildMovieList(context, movies);
          }else {
            return Container();
          }
        }
        ),
    );
  }

  ListView _buildMovieList(BuildContext context, BaseModel<Popular> movies) {
    ScreenConfig().init(context);
    return ListView.builder(
      itemCount: movies.data.results.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context,index){
        return Card(
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        IMAGE_URL + movies.data.results[index].posterPath,
                      ),
                      fit: BoxFit.contain
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    child: Column(
                      children: <Widget>[
                        Text(
                          movies.data.results[index].title,
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              movies.data.results[index].overview,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]
            ),
          ),
        );
      },
    );
  }
}