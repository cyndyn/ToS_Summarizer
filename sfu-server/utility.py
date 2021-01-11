from dataclasses import dataclass
import sys
import logging
# Change rename do anything you want! Skeletons
TOPICS_DICT = {	'PRIVACY': ['privacy', 'content', 'collect', 'property', 'waiver'],
				'LIABILITY': ['liability', 'negligence'],
				'SECURITY': ['security', 'account'],
				'COPYRIGHT': ['copyright', 'trademark', 'intellectual property']}

logging.basicConfig(level=logging.DEBUG)

def get_sections(data):
    '''
    divide text into a list of different sections
    returns an array of Sections class
    '''
    sections_dict = {}

    x = data.split("\n\n")

    for i in range(len(x) - 1):
        string = ''
        if len(x[i].split()) < 10:
            title = i
            i += 1
            while len(x[i].split()) > 10  or "- " in x[i] and i < len(x) - 1:
                string = string + x[i]
                i += 1
            sections_dict[x[title]]=string
    
    return sections_dict


def prep_incoming(data, topic_choice):
	'''
	Remove irrelevant sections
	from the data.

	Keyword arguments:
		data -- string of data to parse

	Returns:ß
		parsed_data -- string of parsed data
	'''
	try:
		keywords = TOPICS_DICT[topic_choice]
	except KeyError as error:
		logging.error(error)
		raise

	section_list = get_sections(data)

	for section in list(section_list.keys()):
		if not any(keyword in section.lower() for keyword in keywords):
			logging.info(f' Removing {section} and associated content from the Summary object')
			del section_list[section]

	parsed_data = ''
	for content in list(section_list.values()):
		parsed_data = parsed_data + ' ' + content

	logging.info(f' Sending parsed data to the model:\n{parsed_data}\n')
	return parsed_data

###FOR DEVELOPMENT:
# def main():
# 	text = open(sys.argv[1], 'r').read()
# 	prep_incoming(text)


# if __name__ == '__main__':
#     main()
