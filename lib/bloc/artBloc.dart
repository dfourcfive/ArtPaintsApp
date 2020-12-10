import 'package:art/models/artModel.dart';
import 'package:art/repo/artRepo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class artEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchartEvent extends artEvent {
  final _title;

  FetchartEvent(this._title);

  @override
  List<Object> get props => [_title];
}

class Resetart extends artEvent {}

class artState extends Equatable {
  @override
  List<Object> get props => [];
}

class artIsNotSearched extends artState {}

class artIsLoading extends artState {}

class artIsLoaded extends artState {
  var _paints;

  artIsLoaded(this._paints);

  List<ArtObjects> get artPaints => _paints;

  @override
  List<Object> get props => [_paints];
}

class artIsNotLoaded extends artState {}

// ignore: camel_case_types
class artBloc extends Bloc<artEvent, artState> {
  artBloc(artState initialState) : super(initialState);

  @override
  void onTransition(Transition<artEvent, artState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<artState> mapEventToState(artEvent event) async* {
    if (event is FetchartEvent) {
      yield artIsLoading();
      try {
        var artrepo = new artRepo();
        List<ArtObjects> artObjects =
            await artrepo.preProcess(event._title.toString());
        yield artIsLoaded(artObjects);
      } catch (_) {
        print(_);
        yield artIsNotLoaded();
      }
    } else if (event is Resetart) {
      yield artIsNotSearched();
    }
  }
}
