" does not work
:command -nargs=* PytestVenvRun
    \ terminal bash -c 'source venv/bin/activate; python -m pytest'
