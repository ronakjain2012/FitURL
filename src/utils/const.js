export const FIELD_TYPE_STRING = 'elString';
export const FIELD_TYPE_NUMBER = 'elNumber';
export const FIELD_TYPE_FLOAT = 'elFloat';
export const FIELD_TYPE_EMAIL = 'elEmail';
export const FIELD_TYPE_DATETIME = 'elDatetime';
export const FIELD_TYPE_TIME = 'elTime';
export const FIELD_TYPE_DATE = 'elDate';
export const FIELD_TYPE_SUGGESTION_STRING = 'elSuggestionString';
export const FIELD_TYPE_DROPDOWN = 'elDropdown';
export const FIELD_TYPE_MULTISELECT = 'elMultiselect';
export const FIELD_TYPE_AUTOCOMPLETE = 'elAutocomplete';
export const FIELD_TYPE_SWITCH = 'elSwitch';
export const FIELD_TYPE_FILE_UPLOAD = 'elFileUpload';
export const FIELD_TYPE_IMAGE_UPLOAD = 'elImageUpload';
export const FIELD_TYPE_GALLERY_UPLOAD = 'elGalleryUpload';
export const FIELD_TYPE_FOLDER_UPLOAD = 'elFolderUpload';
export const FIELD_TYPE_TEXTAREA = 'elTextarea';
export const FIELD_TYPE_RICHTEXTAREA = 'elRichtextarea';

export const SYSTEM_FLOAT_PERCISION = 3;

export const ACTION_ID_ADD = 'add';
export const ACTION_ID_UPDATE = 'update';
export const ACTION_ID_DELETE = 'delete';
export const ACTION_ID_OTHER = 'other';
export const ACTION_MODE_ADD = 'add';
export const ACTION_MODE_UPDATE = 'update';
export const ACTION_MODE_OTHER = 'other';

export const PAGE_ID_INDEX = 'index';
export const PAGE_ID_ROOT = 'root';
export const PAGE_ID_MASTERS = 'master';
export const PAGE_ID_TRANSACTIONS = 'transaction';
export const PAGE_ID_PROFILE = 'profile';
export const PAGE_ID_REPORTS = 'report';
export const PAGE_ID_USER = 'user';
export const PAGE_ID_SETTINGS = 'setting';
export const PAGE_ID_OTHERS = 'others';

export const ACTION_TYPE_LINK = 'link';
export const ACTION_TYPE_BUTTON = 'button';
export const ACTION_TYPE_ICON = 'icon';
export const ACTION_TYPE_POPUP = 'popup';

export const ACTION_METHOD_POST = 'POST';
export const ACTION_METHOD_GET = 'GET';

export const ACTION_HANDLER_FORM = 'form';
export const ACTION_HANDLER_LIST = 'list';
export const ACTION_HANDLER_BUTTON = 'button';
export const ACTION_HANDLER_PAGE = 'button';

export const OFFER_TABLE = 'table';
export const OFFER_FORM = 'form';

export const ACTION_TYPE_TABLE = 'table';
export const ACTION_TYPE_ACTION = 'action';

export const SEARCHABLE_FIELDS = {
    FIELD_TYPE_STRING : 1,
    FIELD_TYPE_NUMBER : 1,
    FIELD_TYPE_FLOAT : 1,
    FIELD_TYPE_EMAIL : 1,
}

/* Size in KB */
export const FILE_UPLOAD_CONFIG = {
    'ext':['pdf','txt','wps','zip','tz','xls','xlsx','wks','xlr','rtf','doc', 'docx', 'xml','dotx','csv','ppt','ppsx','pps','bmp', 'jpg','jpeg', 'pjpeg', 'gif', 'png','mp3','amp','mp4','odt','pptx'],
    'maxSize':10,
    'minSize':5120,
};

export const PRIORITY = [1, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];



export const COMPANY_CONTEXT = 'company'
export const USER_CONTEXT = 'user'
export const ROOT_CONTEXT = 'root'

export default {
    COMPANY_CONTEXT,
    USER_CONTEXT,
    ROOT_CONTEXT,
    FIELD_TYPE_STRING,
    FIELD_TYPE_NUMBER,
    FIELD_TYPE_FLOAT,
    FIELD_TYPE_EMAIL,
    FIELD_TYPE_DATETIME,
    FIELD_TYPE_TIME,
    FIELD_TYPE_DATE,
    FIELD_TYPE_SUGGESTION_STRING,
    FIELD_TYPE_DROPDOWN,
    FIELD_TYPE_MULTISELECT,
    FIELD_TYPE_AUTOCOMPLETE,
    FIELD_TYPE_SWITCH,
    FIELD_TYPE_FILE_UPLOAD,
    FIELD_TYPE_IMAGE_UPLOAD,
    FIELD_TYPE_GALLERY_UPLOAD,
    FIELD_TYPE_FOLDER_UPLOAD,
    FIELD_TYPE_TEXTAREA,
    FIELD_TYPE_RICHTEXTAREA,
    SYSTEM_FLOAT_PERCISION,
}