import sys
import warnings
warnings.filterwarnings("ignore", category=UserWarning)

from summarizer import Summarizer
from utility import prep_incoming, prep_outgoing


if __name__ == "__main__":
    text = open(sys.argv[1], 'r').read()
    parsed_data = prep_incoming(text)
    
    model = Summarizer()
    result = model(parsed_data, min_length=30)
    summary = ''.join(result)

    print(summary)

    prep_outgoing(summary)