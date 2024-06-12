
import 'package:freezed_annotation/freezed_annotation.dart';
part 'homepage_state.freezed.dart';

@freezed
class HomepageState with _$HomepageState {
const factory HomepageState({
    // Se ricevessimo nella View una var stringa da fuori (che vogliamo salvare nello state)
    //String? str,
    @Default(false) bool isLoading,
}) = HomepageData;
}

    