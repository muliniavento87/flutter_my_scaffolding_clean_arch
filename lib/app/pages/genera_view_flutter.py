import os


def start():
    guida = """
    Questo script crea una cartella con i files della vista da usare in combo con Riverpod e Freeze su Flutter.
    1. Richiede un valore di input (es. 'load_video')
    2. Creerà una cartella 'load_video'
    3. Nella cartella creerà 3 files:
        - load_video.dart
            - class LoadVideo extends ConsumerWidget
        - load_video_state.dart
            - class LoadVideoState with _$LoadVideoState
        - load_video_vm.dart
            - class LoadVideoVM extends StateNotifier<LoadVideoState>
    """

    print(guida)
    print("")

    key = input("Parola chiave (es. 'load_video'): ")


    # Crea la cartella se non esiste già
    if not os.path.exists(key):
        os.makedirs(key)
        print('Cartella \"{}\" creata con successo.'.format(key))
    else:
        print('La cartella \"{}\" esiste già.'.format(key))
        return


    id = ''.join([i.capitalize() for i in key.split('_')])
    idNotCap = id[0].lower() + id[1:]
    

    # Crea View
    content = """
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '#KEY#_vm.dart';


class #ID# extends ConsumerWidget {
    // Se ricevessimo una var stringa "s" da fuori
    //final String s;
    //#ID#(this.s, #SUPER_KEY#);

    #ID#(#SUPER_KEY#);

    @override
    Widget build(BuildContext context, WidgetRef ref) {
        // Se ricevessimo una var stringa "s" da fuori che vogliamo mettere nello state
        //final vm = ref.read(#ID_NO_CAP#Provider(s).notifier);
        //final state = ref.watch(#ID_NO_CAP#Provider(s));

        final vm = ref.read(#ID_NO_CAP#Provider.notifier);
        final state = ref.watch(#ID_NO_CAP#Provider);

        return Scaffold(
            appBar: AppBar(),
            body: (state.isLoading) ?
            Center(
                child: CircularProgressIndicator(),
            ) : Container()
        );
    }
}
    """.replace('#KEY#', key).replace('#ID#', id).replace('#SUPER_KEY#', "{super.key}").replace('#ID_NO_CAP#', idNotCap)

    fileToCreate = '{}/{}{}'.format(key, key, '.dart')
    with open(fileToCreate, 'w') as file:
        file.write(content)
    

    # Crea VM
    content = """
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '#KEY#_state.dart';


class #ID#VM extends StateNotifier<#ID#State> {
    final Ref ref;

    // Se ricevessimo una var stringa "s" da fuori
    //final String s;
    //#ID#VM(this.ref, this.s) : super(#ID#Data(str: s)) {
    //    initAsync();
    //}

    #ID#VM(this.ref) : super(const #ID#Data()) {
        initAsync();
    }

    Future<void> initAsync() async {
        state = state.copyWith(isLoading: true);
        // elaborazioni varie
        state = state.copyWith(isLoading: false);
    }
}

// Se ricevessimo una var stringa "s" da fuori
//final #ID_NO_CAP#Provider = StateNotifierProvider.autoDispose.family<#ID#VM, #ID#State, String>((ref, s) {
//  return #ID#VM(ref, s);
//});

/// vm provider
final #ID_NO_CAP#Provider = StateNotifierProvider.autoDispose<#ID#VM, #ID#State>((ref) {
    return #ID#VM(ref);
});

    """.replace('#KEY#', key).replace('#ID#', id).replace('#ID_NO_CAP#', idNotCap)

    fileToCreate = '{}/{}{}'.format(key, key, '_vm.dart')
    with open(fileToCreate, 'w') as file:
        file.write(content)
    

    # Crea State
    content = """
import 'package:freezed_annotation/freezed_annotation.dart';
part '#KEY#_state.freezed.dart';

@freezed
class #ID#State with _$#ID#State {
const factory #ID#State({
    // Se ricevessimo nella View una var stringa da fuori (che vogliamo salvare nello state)
    //String? str,
    @Default(false) bool isLoading,
}) = #ID#Data;
}

    """.replace('#KEY#', key).replace('#ID#', id)

    fileToCreate = '{}/{}{}'.format(key, key, '_state.dart')
    with open(fileToCreate, 'w') as file:
        file.write(content)


# avvio elaborazione
start()