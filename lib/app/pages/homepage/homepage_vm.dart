
import 'package:data_module/data_module.dart';
import 'package:domain_module/usecases/app_config/switch_theme_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'homepage_state.dart';


class HomepageVM extends StateNotifier<HomepageState> {
    final Ref ref;

    // Se ricevessimo una var stringa "s" da fuori
    //final String s;
    //HomepageVM(this.ref, this.s) : super(HomepageData(str: s)) {
    //    initAsync();
    //}

    HomepageVM(this.ref) : super(const HomepageData()) {
        initAsync();
    }

    Future<void> initAsync() async {
        state = state.copyWith(isLoading: true);
        // elaborazioni varie
        state = state.copyWith(isLoading: false);
    }

    switchTheme() {
        SwitchThemeUseCase(ref.read(appConfigRepositoryProvider)).call(ref);
    }
}

// Se ricevessimo una var stringa "s" da fuori
//final homepageProvider = StateNotifierProvider.autoDispose.family<HomepageVM, HomepageState, String>((ref, s) {
//  return HomepageVM(ref, s);
//});

/// vm provider
final homepageProvider = StateNotifierProvider.autoDispose<HomepageVM, HomepageState>((ref) {
    return HomepageVM(ref);
});

    